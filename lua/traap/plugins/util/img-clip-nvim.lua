return {
  "HakonHarnes/img-clip.nvim",
  enabled = true,
  event = {"BufReadPost", "BufNewFile"},

  keys = {
    {"<leader>pi", "<cmd>PasteImage<cr>", desc = "Save and Paste Image"},
  },

  opts = {
    default = {
      -- YouTube: 1st - Almost self explanitory settings
      debug = false,
      insert_mode_after_paste = true,
      template = "$FILE_PATH",
      url_encode_path = true,
      use_cursor_in_template = true,

      -- YouTube: 2nd - Adjust dir_path
      dir_path = function()
        return "images/" .. vim.fn.expand("%:t:r")
      end,
      file_name = "%Y-%m-%d-%H-%M-%S",

      -- YouTube: 3rd - Toggle relative_to_current_file.
      use_absolute_path = false,
      relative_to_current_file = true,

      -- YouTube: 4th - Toggle show_dir_path_in_prompt
      prompt_for_file_name = true,
      show_dir_path_in_prompt = true,

      -- YouTube: 5th - base64
      embed_image_as_base64 = true,
      max_base64_size = 10,

      -- YouTube: 6th - Drag and drop
      drag_and_drop = {
        enabled = true,
        insert_mode = true,
        copy_images = true,
        download_images = true,
      },
    },

    -- YouTube: 0th - Quickly cover file types.
    asciidoc = {
      template = 'image::$FILE_PATH[width=80%, alt="$CURSOR"]',
    },

    html = {
      template = '<img src="$FILE_PATH" alt="$CURSOR">',
    },

    markdown = {
      url_encode_path = true,
      template = "![$CURSOR]($FILE_PATH)",
    },

    org = {
      template = [=[
      #+BEGIN_FIGURE
      [[file:$FILE_PATH]]
      #+CAPTION: $CURSOR
      #+NAME: fig:$LABEL
      #+END_FIGURE
      ]=],
    },

    rst = {
      template = [[
      .. image:: $FILE_PATH
      :alt: $CURSOR
      :width: 80%
      ]],
    },

    tex = {
      template = [[
      \begin{figure}[h]
      \centering
      \includegraphics[width=0.8\textwidth]{$FILE_PATH}
      \caption{$CURSOR}
      \label{fig:$LABEL}
      \end{figure}
      ]],
    },

    typst = {
      template = [[
      #figure(
      image("$FILE_PATH", width: 80%),
      caption: [$CURSOR],
      ) <fig-$LABEL>
      ]],
    },

    wiki = {
      url_encode_path = true,
      template = "![$CURSOR]($FILE_PATH)",
    },

  },
}
