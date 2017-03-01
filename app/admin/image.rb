ActiveAdmin.register Image do
  permit_params :file, :name

  index as: :grid, columns: 8 do |image|
    panel image.name do
      link_to image_tag(image.file.url(:thumb)), admin_image_path(image)
    end
  end

  # index as: :block do |image|
  #   div for: image do
  #     # resource_selection_cell image
  #     div link_to image_tag(image.file.url(:thumb)), admin_image_path(image)
  #   end
  # end

  show do
    attributes_table do
      row :name
      row :image do |image|
        image_tag image.file.url
      end
      row :url do |image|
        image.file.url
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "Upload" do
      f.input :name
      f.input :file, required: true, as: :file
    end
    f.actions
  end

end
