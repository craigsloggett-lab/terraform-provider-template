---
page_title: "template_example Data Source - Scaffolding"
subcategory: ""
description: |-
  Example data source
---

# template_example (Data Source)

Example data source

## Example Usage

```terraform
data "template_example" "example" {
  configurable_attribute = "abc123"
}
```
<!-- schema generated by tfplugindocs -->
## Schema

### Optional

- `configurable_attribute` (String) Example configurable attribute

### Read-Only

- `id` (String) Example identifier

