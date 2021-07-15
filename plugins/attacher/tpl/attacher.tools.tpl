<!-- BEGIN: MAIN -->
<h2>{PHP.L.att_attachments}</h2>
{FILE "{PHP.cfg.themes_dir}/{PHP.cfg.defaulttheme}/warnings.tpl"}
<ul>
      <li><a href="{PHP|cot_url('admin', 'm=other&p=attacher&a=cleanup')}" onclick="return confirm('{PHP.L.att_cleanup_confirm}')">{PHP.L.att_cleanup}</a></li>
      <li><a href="{PHP|cot_url('admin', 'm=other&p=attacher&a=allthumbsremove')}" onclick="return confirm('{PHP.L.att_allthumbs_remove_confirm}')">{PHP.L.att_allthumbs_remove}</a></li>
</ul>
<!-- END: MAIN -->
