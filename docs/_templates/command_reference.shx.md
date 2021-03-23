---
title: "<%= $(command getName) %>"
---

{% raw %}

<% context goto parent %>
<% if command getName parentCommandName; then %>
<% if [ -n "${parentCommandName// }" ]; then %>

[🔙 Back to <%= $parentCommandName %>](<%= /${API_ROOT}/${parentCommandName// //} %>)

---
<% fi %>
<% fi %>

<% context goto path "$commandPath" %>

<% ambiguousTocItems=0 %>

<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

<% if [ -n "$(command getName)" ]; then %>
# <%= $(command getName) %>
<% else %>
# <%= ${commandPath#@commands/} %>
<% fi %>

<% if context has sourceCode.sh; then %>

<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
<%= $(context getValue sourceCode.sh) %>
{% endhighlight %}
{% raw %}

</details>
<% fi %>

<% if context has description; then %>
<%= $(command getDescription) %>
<% fi %>

<% if context getList parameters parameterNames; then -%>
#### Parameters

| | Type | Description |
|-|------|-------------|
<% for parameterName in "${parameterNames[@]}"; do -%>
| `<%= $parameterName %>` | <%= $(context getValue "parameters/$parameterName/type" ) %> | <%= $(context getValue "parameters/$parameterName/description" ) %> |
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

<% if command list childCommandPaths; then %>
<% for childCommandPath in "${childCommandPaths[@]}"; do %>
    <% context goto path "$childCommandPath" %>
    <% commandName="$(command getName)" %>
    <% commandLink="#${commandName// /-}-1" %>
    <% [ "${commandName##* }" = '--' ] && : "$(( ambiguousTocItems++ ))" %>
    <%
      if [ "${commandName##* }" = ':' ] || [ "${commandName##* }" = '}' ]
      then
        : "$(( ambiguousTocItems++ ))"
        commandLinkPrefix="${commandName// /-}"
        commandLinkPrefix="${commandLinkPrefix/%-${commandName##* }}"
        commandLink="#$commandLinkPrefix--${ambiguousTocItems}"
      fi
    %>

<% if [ -n "$(command getName)" ]; then %>
## [`<%= $commandName %>`](<%= ${commandLink,,} %>)
<% else %>
## [`<%= ${commandPath#@commands/} %>`](<%= ${commandLink,,} %>)
<% fi %>

    <% subcommandPaths=() -%>
    <% if command list subcommandPaths; then -%>
      <% for subcommandPath in "${subcommandPaths[@]}"; do -%>
        <% context goto path "$subcommandPath" %>
        <% subcommandName="$(command getName)" %>
        <% subcommandLink="#${subcommandName// /-}" %>
        <% [ "${subcommandName##* }" = '--' ] && : "$(( ambiguousTocItems++ ))" %>
        <%
          if [ "${subcommandName##* }" = ':' ] || [ "${subcommandName##* }" = '}' ]
          then
            : "$(( ambiguousTocItems++ ))"
            subcommandLinkPrefix="${subcommandName// /-}"
            subcommandLinkPrefix="${subcommandLinkPrefix/#-${subcommandName##* }}"
            subcommandLink="#${subcommandLinkPrefix// /-}--${ambiguousTocItems}"
          fi
        %>

- [`<%= ${subcommandName} %>`](<%= ${subcommandLink,,} %>)
  <% done -%>
  <% fi -%>
  <% done -%>

<% if [ "${#childCommandPaths[@]}" -gt 0 ]; then %>

# 📓 Command Reference

<% for childCommandPath in "${childCommandPaths[@]}"; do %>
    <% context goto path "$childCommandPath" %>
<% commandName="$(command getName)" %>
    <% commandLink="/${API_ROOT}/${commandName// //}" %>
    <% commandLink="${commandLink/%:/colon}" %>

# [`<%= $commandName %>`](<%= $commandLink %>)

<% if context has sourceCode.sh; then %>

<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
<%= $(context getValue sourceCode.sh) %>
{% endhighlight %}
{% raw %}

</details>
<% fi %>

<% parameterNames=() %>
<% if context getList parameters parameterNames; then -%>
| | Type | Description |
|-|------|-------------|
<% for parameterName in "${parameterNames[@]}"; do -%>
| `<%= $parameterName %>` | <%= $(context getValue "parameters/$parameterName/type" ) %> | <%= $(context getValue "parameters/$parameterName/description" ) %> |
<% done %>
<% fi %>

<% if context has description; then -%>
<%= $(command getDescription) %>
<% fi %>

    <% subcommandPaths=() -%>
    <% if command list subcommandPaths; then -%>
      <% for subcommandPath in "${subcommandPaths[@]}"; do -%>
        <% context goto path "$subcommandPath" %>
        <% subcommandName="$(command getName)" %>
        <% subcommandLink="/${API_ROOT}/${subcommandName// //}" %>
        <% subcommandLink="${subcommandLink/%:/colon}" %>

## [`<%= $subcommandName %>`](<%= $subcommandLink %>)

<% if context has sourceCode.sh; then %>

<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
<%= $(context getValue sourceCode.sh) %>
{% endhighlight %}
{% raw %}

</details>
<% fi %>

<% parameterNames=() %>
<% if context getList parameters parameterNames; then -%>
| | Type | Description |
|-|------|-------------|
<% for parameterName in "${parameterNames[@]}"; do -%>
| `<%= $parameterName %>` | <%= $(context getValue "parameters/$parameterName/type" ) %> | <%= $(context getValue "parameters/$parameterName/description" ) %> |
<% done %>
<% fi %>

<% if context has description; then -%>
<%= $(command getDescription) %>
<% fi %>

    <% subSubCommandPaths=() %>
    <% if command list subSubCommandPaths; then %>

      <% for subSubCommandPath in "${subSubCommandPaths[@]}"; do -%>
        <% context goto path "$subSubCommandPath" -%>
        <% subSubCommandName="$(command getName)" -%>
        <% subSubCommandLink="/${API_ROOT}/${subSubCommandName// //}" %>
        <% subSubCommandLink="${subSubCommandLink/%:/colon}" %>

- [`<%= $subSubCommandName %>`](<%= $subSubCommandLink %>)
  <% done -%>
  <% fi -%>

        <% done -%>
      <% fi -%>

  <% done -%>
  <% fi -%>
  <% fi -%>

{% endraw %}
