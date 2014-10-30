$(function () {
    $('#redditContainer').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Reddit Rants Sexist Profanity Zeitgeist'
        },
        subtitle: {
            text: 'Taken from the Top 20 /r/Rants posts and from a search on "Reddit Post with the most profanity"'
        },
        xAxis: {
            categories: ["Sainsbury's", 'In regards to Jesus, a rant about resemblance', 'WOMEN IN PUBLIC BATHROOMS, YOU ARE FOUL, VILE, DISGUSTING CREATURES!', 'Dear attention seeking whore colleague', "Hey kids - while you're complaining about being adults, please remember that your parents are people too", 'To all the moms who put their kids in the pageants on Toddlers and Tiaras:', 'Facebook friends make me feel like my life sucks. ', '"Oh, I see you only paid your rent one week early instead of two. Get your shit and get out."', "Holiday Dinner at My Brother's house- after 27 years in Prison", 'fucking abobe fuck OFF!', 'GOD DAMMIT I DROPPED THE PIZZA ID JUST BEEN COOKING AND IT WAS THE LAST ONE AND I WANTED IT SO BAD AND IM SO HUNGRY AND NOW I CANT HAVE IT FUCK', 'People need to stop acting like Barack Obama is a fucking celebrity.', "What I wish I'd said at my job interview today", 'Fuck hate rude cashiers!', 'Goodbye, CNN.com.', 'Ah, high school...', "It's 5:34 AM, and I'm pissed.", 'The left lane is a passing lane!', 'Ice Bucket Challenge', 'FUCK THE POLICE. No, fuck you.', 'Dear Bungie, I quit. I apologize for the profanity.'],
            labels: {
                formatter: function () {
                    return this.value.slice(0, 10) + '...';      }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Profanity Count'
            }
        },
        tooltip: {
            pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
            shared: true
        },
        plotOptions: {
            column: {
                stacking: 'normal'
            }
        },
        series: [{
            name: 'Beastiality',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }, {
            name: 'Anit-Male',
            data: [5, 0, 0, 1, 0, 0, 0, 4, 0, 2, 0, 0, 5, 1, 0, 0, 2, 0, 0, 2, 6]
        }, {
            name: 'Anit-Female',
            data: [8, 0, 3, 5, 0, 2, 0, 0, 1, 4, 0, 1, 5, 5, 0, 0, 2, 0, 0, 5, 29]
        }, {
            name: 'Homophobic',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2]
        }, {
            name: 'Other',
            data: [144, 7, 12, 15, 1, 11, 6, 13, 15, 13, 2, 21, 10, 14, 1, 6, 55, 8, 5, 13, 202]
        }, {
            name: 'Racist',
            data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
        ]
    });
});
