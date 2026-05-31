{ ... }: {
  plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      source = [
        { name = "ultisnips"; }
        { name = "nvim_lsp"; }
        { name = "async_path"; }
        { name = "dap"; }
        { name = "nvim_lsp_document_symbol"; }
        { name = "treesitter"; }
        { name = "nvim_lsp_signature_help"; }
        { name = "fuzzy_buffer"; }
      ];

      snippet.expand = # lua
        ''
        function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end
        '';

      mapping = {
	# Select the [n]ext item
	"<C-n>" = "cmp.mapping.select_next_item()";
	# Select the [p]revious item
	"<C-p>" = "cmp.mapping.select_prev_item()";
	# Scroll the documentation window [b]ack / [f]orward
	"<C-b>" = "cmp.mapping.scroll_docs(-4)";
	"<C-f>" = "cmp.mapping.scroll_docs(4)";
	# Accept ([y]es) the completion.
	#  This will auto-import if your LSP supports it.
	#  This will expand snippets if the LSP sent a snippet.
	"<C-y>" = "cmp.mapping.confirm { select = true }";
	# If you prefer more traditional completion keymaps,
	# you can uncomment the following lines.
	# "<CR>" = "cmp.mapping.confirm { select = true }";
	# "<Tab>" = "cmp.mapping.select_next_item()";
	# "<S-Tab>" = "cmp.mapping.select_prev_item()";

	# Manually trigger a completion from nvim-cmp.
	#  Generally you don't need this, because nvim-cmp will display
	#  completions whenever it has completion options available.
	"<C-q>" = "cmp.mapping.complete()";
	
	# Think of <c-l> as moving to the right of your snippet expansion.
	#  So if you have a snippet that's like:
	#  function $name($args)
	#    $body
	#  end
	#
	# <c-l> will move you to the right of the expansion locations.
	# <c-h> is similar, except moving you backwards.
	"<C-l>" = # lua
          ''
          cmp.mapping(function(fallback)
            require("cmp_nvim_ultisnips.mappings").expand_or_jump_forwards(fallback)
          end, { 'i', 's' })
          '';
	"<C-h>" = # lua
          ''
          cmp.mapping(function(fallback)
            require("cmp_nvim_ultisnips.mappings").jump_backwards(fallback)
          end, { 'i', 's' })
          '';
      };
    };
  };
}
