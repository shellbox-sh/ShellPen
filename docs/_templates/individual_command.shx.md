---
title: '<%= $commandName %>'
permalink: /docs/<%= $pageName %>
layout: single
sidebar:
  nav: 'command_reference'
---

<% if context has sourceCode.sh; then %>

<details>
  <summary>View Source</summary>

{% highlight sh %}
<%= $( context getValue sourceCode.sh | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}

</details>
<% fi %>

<% if context has description; then %>
<%= $(command getDescription) %>
<% fi %>

<% parameterNames=() -%>
<% if command getParameterNames parameterNames; then -%>
#### Parameters

| | Description |
|-|-------------|
<% for parameterName in "${parameterNames[@]}"; do -%>
| `<%= $parameterName %>` | <%= $(context getValue "parameters/$parameterName/description" ) %> |
<% done %>
<% fi %>

<% if context getList returnValues returnValues; then %>
#### Return Values

| | Description |
|-|-------------|
<% for returnValue in "${returnValues[@]}"; do -%>
| `<%= $returnValue %>` | <%= $(context getValue "returnValues/$returnValue") %> |
<% done %>
<% fi %>

<% exampleNames=() %>
<% if context getList examples exampleNames; then %>
<% for exampleName in "${exampleNames[@]}"; do %>
<% if ! [[ "$exampleName" = *"output"* ]]; then %>

<% if [ "$exampleName" = default ]; then %>
<% outputExampleName="output" %>

#### Example

<% else %>
<% outputExampleName="$exampleName output" %>

#### <%= $exampleName %>

<% fi %>

{% highlight sh %}
<%= $( context getValue "examples/$exampleName"  | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}

<% if context has "examples/$outputExampleName output"; then %>
<% fi %>

<details>
  <summary>View Output</summary>

{% highlight sh %}
<%= $( context getValue "examples/$outputExampleName" | sed "s/{{/{{ '{{' }}/g" ) %>
{% endhighlight %}

</details>

<% fi %>
<% done %>
<% fi %>