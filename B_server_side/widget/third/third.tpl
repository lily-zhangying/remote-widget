<div id='third'>
    <p>
        third screen group a
    </p>
</div>
{%script%}
require.async('/widget/head/head.js', function(h) {
    h.hello();
});
{%/script%}