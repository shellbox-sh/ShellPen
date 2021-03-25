---
title: '🖋️ Command Reference'
permalink: /docs
layout: single
sidebar:
  nav: 'command_reference'
---

<% for commandName in "${DSL_COMMANDS[@]}"; do -%>
<% context goto path "@commands/DSL/$commandName" -%>
<% pageName="$( echo "$commandName" | sed "s/{{/{{ '{{' }}/g" )" -%>
<% [ "$pageName" = ':' ] && pageName='colon' -%>
<% [ "$pageName" = '::' ] && pageName='colon-colon' -%>
<% outputName="$( echo "$commandName" | sed "s/{{/{{ '{{' }}/g" )" -%>
| [`<%= $outputName %>`](/docs/<%= $pageName %>) | <%= $(context getValue description | head -1 | sed 's/^> //' | sed "s/{{/{{ '{{' }}/g" 2>/dev/null) %> |
<% done %>