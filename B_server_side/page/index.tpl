{%html framework="pagelet:static/mod.js"%}
    {%head%}
        <title>test</title>
        <script type="text/javascript" src="/static/lazyload.js"></script>
        <script type="text/javascript" src="/static/BigPipe.js"></script>
        <script type="text/javascript">
        window.onload = function() {
            var elms = document.getElementsByClassName('g_fis_bigrender');
            for (var i = 0, len = elms.length; i < len; i++) {
                window['eval'] && window['eval'](elms[i].innerHTML);
            }
        };
        </script>
    {%/head%}
    {%body%}
        {%style%}
        body {
            background-color: #EEEEEE;
        }
        {%/style%}
        {%require name="pagelet:page/index.css"%}

        <!-- 普通非quickling widget -->
        {%widget name="pagelet:widget/first/first.tpl"%}

        <!-- 有嵌套的widget -->
        {%widget name="pagelet:widget/box/box.tpl" pagelet_id="w_container" %}

        <!-- 有 group属性widget -->
        {%widget name="pagelet:widget/third/third.tpl" pagelet_id="third" mode="quickling" group="a"%}
        {%widget name="pagelet:widget/third_1/third_1.tpl" pagelet_id="third_1" mode="quickling" group="a"%}
         {%widget name="pagelet:widget/third_2/third_2.tpl" pagelet_id="third_2" mode="quickling" group="a"%}


    {%/body%}
{%/html%}
