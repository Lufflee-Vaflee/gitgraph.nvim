local M = {}

---@class I.HighlightGroup
---@field name string
---@field fg string

---@type table<string, I.HighlightGroup>
M.ITEM_HGS = {
  hash = { name = 'GitGraphHash', fg = '#b16286' },
  timestamp = { name = 'GitGraphTimestamp', fg = '#98971a' },
  author = { name = 'GitGraphAuthor', fg = '#458588' },
  branch_name = { name = 'GitGraphBranchName', fg = '#d5651c' },
  tag = { name = 'GitGraphBranchTag', fg = '#d79921' },
  message = { name = 'GitGraphBranchMsg', fg = '#339921' },
}

---@type I.HighlightGroup[]
M.BRANCH_HGS = {
  { name = 'GitGraphBranch1', fg = '#0086d4' },
  { name = 'GitGraphBranch2', fg = '#ed008d' },
  { name = 'GitGraphBranch3', fg = '#e7842a' },
  { name = 'GitGraphBranch4', fg = '#b205d3' },
  { name = 'GitGraphBranch5', fg = '#ff0020' },
  { name = 'GitGraphBranch6', fg = '#00dacb' },  -- Red
  { name = 'GitGraphBranch7', fg = '#f537e2' },  -- Aqua
  { name = 'GitGraphBranch8', fg = '#67d93b' },  -- Gray
  { name = 'GitGraphBranch9', fg = '#7828cf' },  -- Light Blue
  { name = 'GitGraphBranch10', fg = '#ffcb3f' }, -- Light Purple
}

--- sets highlight groups if they are missing
function M.set_highlights()
  local function set_hl(name, highlight)
    local existing_hg = vim.api.nvim_get_hl(0, { name = name })
    if #existing_hg == 0 then
      vim.api.nvim_set_hl(0, name, vim.tbl_deep_extend('force', highlight, { default = true }))
    end
  end

  for _, hg in pairs(M.BRANCH_HGS) do
    set_hl(hg.name, { fg = hg.fg })
  end

  for _, hg in pairs(M.ITEM_HGS) do
    set_hl(hg.name, { fg = hg.fg })
  end
end

return M
