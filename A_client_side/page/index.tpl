{%html framework="demo:static/mod.js"%}
    {%head%}
        <title>test</title>
        <script type="text/javascript" src="/static/lazyload.js"></script>
        <script type="text/javascript" src="/static/BigPipe.js"></script>
        <script type="text/javascript">
        </script>
    {%/head%}
    {%body%}
        {%style%}
        body {
            background-color: #EEEEEE;
        }
        {%/style%}

        <h1>test data:  {%$b.index%} </h1>

        {%require name="demo:page/index.css"%}

        <!-- 有嵌套的widget -->
        {%remote_widget name="pagelet:widget/box/box.tpl" pagelet_id="w_container" rule="rule1"%}

        <!-- 请求group，不支持group属性，需要写三个remote_widget一起请求 -->
        {%remote_widget name="pagelet:widget/third/third.tpl" pagelet_id="third" rule="rule1"%}

        {%remote_widget name="pagelet:widget/third_1/third_1.tpl" pagelet_id="third_1" rule="rule1"%}

        {%remote_widget name="pagelet:widget/third_2/third_2.tpl" pagelet_id="third_2" rule="rule1"%}


    {%/body%}
{%/html%}
