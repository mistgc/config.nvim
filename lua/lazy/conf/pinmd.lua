local opts = {
  files = {
    link_format = "relative_path_in_vault",
    location_for_new_attachments = "specified_folder_in_vault",
    attachment_folder_path = "_attachments/",
  },
}

local pinmd = require("pinmd")
pinmd.setup(opts)
