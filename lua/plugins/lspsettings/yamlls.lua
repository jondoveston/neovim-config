return {
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      validate = true,
      format = { enable = true },
      hover = true,
      schemaStore = {
        -- disable for SchemaStore
        enable = false,
        url = "",
      },
      schemaDownload = { enable = true },
      trace = { server = "debug" },
      completion = true,
      customTags = { "!reference sequence" },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}
