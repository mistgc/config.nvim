local opts = {
  files = {
    location_for_new_attachments = "specified_folder_in_vault",
    attachment_folder_path = "_attachments",
  },
}

require("pinmd").setup(opts)
