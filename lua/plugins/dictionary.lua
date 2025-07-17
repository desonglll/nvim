return {
    "uga-rosa/cmp-dictionary",
    opts = {
        paths = { "/usr/share/dict/words" },
        exact_length = 2,
    },
    config = function(_, opts)
        require("cmp_dictionary").setup(opts)
    end
}
