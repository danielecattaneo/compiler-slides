struct debug_abbrev {
  struct {
    uleb128 id;
    uint8_t has_children;
    struct {
      uleb128 attr_id;
      uleb128 format_id;
    } [M];
    uint16_t terminator = 0;
  } [N];
  uint8_t terminator = 0;
}
