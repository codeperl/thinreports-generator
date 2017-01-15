# coding: utf-8

module Prawn
  module Images
    class Image
      alias_method :original_calc_image_dimensions, :calc_image_dimensions

      def calc_image_dimensions(options)
        if options[:auto_fit]
          w = options[:width] || width
          h = options[:height] || height

          box_width, box_height = options.delete(:auto_fit)

          if w > box_width || h > box_height
            options[:fit] = [box_width, box_height]
          end
        end
        original_calc_image_dimensions(options)
      end
    end
  end
end
