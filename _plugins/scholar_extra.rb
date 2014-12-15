require 'jekyll/scholar'

module Jekyll
  class Scholar
    module Utilities
      def bibliography_tag(entry, index)
        return missing_reference unless entry

        liquid_template.render({
          'site' => site.config,
          'entry' => liquidify(entry),
          'reference' => reference_tag(entry, index),
          'key' => entry.key,
          'type' => entry.type.to_s,
          'link' => repository_link_for(entry),
          'links' => repository_links_for(entry),
          'index' => index,
          'details' => details_link_for(entry)
        })
      end
    end
  end
end
