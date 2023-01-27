<?php

/* ====================
  [BEGIN_COT_EXT]
  Hooks=index.first
  Order=1
  [END_COT_EXT]
  ==================== */

if ($cfg["account"]["redirect"] == 1 && $usr["id"] != 0) {
    cot_redirect(cot_url("account"));
}