{%style%}
#box {
    color: blue;
}
@import url('./box.css?__inline');
{%/style%}
<div id="box">
    box_parent
    {%widget name="pagelet:widget/box/box_child/box_child.tpl"%}
</div>
<script>
alert('test');
</script>
{%script%}
require('../ui/msg/msg.js');
require.async('/widget/head/head.js', function(h) {
    h.hello();
});
{%/script%}
