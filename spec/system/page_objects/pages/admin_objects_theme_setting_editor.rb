# frozen_string_literal: true

module PageObjects
  module Pages
    class AdminObjectsThemeSettingEditor < PageObjects::Pages::Base
      def visit(theme, setting_name)
        page.visit "/admin/customize/themes/#{theme.id}/schema/#{setting_name}"
        self
      end

      def has_setting_field?(field_name, value)
        expect(input_field(field_name).value).to eq(value)
      end

      def has_setting_field_description?(field_name, description)
        expect(input_field_description(field_name)).to have_text(description)
      end

      def click_link(name)
        find(".schema-editor-navigation .node", text: name).click
        self
      end

      def fill_in_field(field_name, value)
        input_field(field_name).fill_in(with: value)
        self
      end

      def save
        click_button(I18n.t("js.save"))
        self
      end

      private

      def input_field(field_name)
        page.find(".schema-field[data-name=\"#{field_name}\"] .schema-field__input input")
      end

      def input_field_description(field_name)
        page.find(".schema-field[data-name=\"#{field_name}\"] .schema-field__description")
      end
    end
  end
end
