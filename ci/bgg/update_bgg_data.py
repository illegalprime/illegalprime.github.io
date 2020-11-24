#!/usr/bin/env python3
import requests
import yaml
import json

from os import path
from xml.etree import ElementTree
from time import sleep

DEFAULT_USER='illegalprime'
COLLECTION_URL = 'https://www.boardgamegeek.com/xmlapi/collection'
BGG_LINK = 'https://boardgamegeek.com/boardgame'
OUTPUT = '../../_data/games/bgg_data.yaml'


def parse_game(game):
    name = None
    stats = {
        'link': path.join(BGG_LINK, game.attrib['objectid']),
        'ratings': {},
    }
    for prop in game:
        if prop.tag == 'name':
            name = prop.text
        elif prop.tag == 'stats':
            stats['minplayers'] = int(prop.attrib['minplayers'])
            stats['maxplayers'] = int(prop.attrib['maxplayers'])
            stats['minplaytime'] = int(prop.attrib['minplaytime'])
            stats['maxplaytime'] = int(prop.attrib['maxplaytime'])
            stats['playingtime'] = int(prop.attrib['playingtime'])
            if prop[0].attrib['value'] != 'N/A':
                stats['ratings']['personal'] = float(prop[0].attrib['value'])
            # get ratings
            for rating in prop[0]:
                if rating.tag == 'average':
                    stats['ratings']['average'] = float(rating.attrib['value'])
                if rating.tag == 'bayesaverage':
                    stats['ratings']['bayesaverage'] = float(rating.attrib['value'])
        elif prop.tag == 'yearpublished':
            stats['year'] = int(prop.text)
        elif prop.tag == 'image':
            stats['image'] = prop.text
    return (name, stats)


def fetch_collection(user=DEFAULT_USER):
    while True:
        collection_xml = requests.get(path.join(COLLECTION_URL, user), params={
            'own': 1,
            'excludesubtype': 'boardgameexpansion',
        })
        if collection_xml.status_code != 429:
            collection_xml.raise_for_status()

        tree = ElementTree.fromstring(collection_xml.content)
        if tree.tag == 'items':
            break
        sleep(1)

    return dict(map(parse_game, tree))


def main():
    collection = fetch_collection()
    dst = path.join(path.dirname(path.realpath(__file__)), OUTPUT)

    with open(dst, 'w') as games_file:
        yaml.dump(collection, games_file)


if __name__ == '__main__':
    main()
