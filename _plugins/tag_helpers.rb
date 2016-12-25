Jekyll::Hooks.register :site, :post_read do |site|
    site.config['tags_by_freq'] = site.tags
        .sort_by { |tag, posts| -posts.length }
        .map { |pair| pair[0] }
end
