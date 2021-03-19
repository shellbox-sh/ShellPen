---
title: "shellpen -- blocks"
---

{% raw %}





[🔙 Back to shellpen --](/api/shellpen/--)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="3"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command3="$1"
shift
case "$__shellpen__mainCliCommands_command3" in
  "cases")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen -- blocks functions`](#shellpen----blocks-functions-1)

                      
        
        
        
        

- [`shellpen -- blocks functions open`](#shellpen----blocks-functions-open)
          
        
        
        
        

- [`shellpen -- blocks functions close`](#shellpen----blocks-functions-close)
      
    
    
    
    
    

## [`shellpen -- blocks closeAll`](#shellpen----blocks-closeall-1)

                  
    
    
    
    
    

## [`shellpen -- blocks options`](#shellpen----blocks-options-1)

                      
        
        
        
        

- [`shellpen -- blocks options open`](#shellpen----blocks-options-open)
          
        
        
        
        

- [`shellpen -- blocks options close`](#shellpen----blocks-options-close)
      
    
    
    
    
    

## [`shellpen -- blocks cases`](#shellpen----blocks-cases-1)

                      
        
        
        
        

- [`shellpen -- blocks cases open`](#shellpen----blocks-cases-open)
          
        
        
        
        

- [`shellpen -- blocks cases close`](#shellpen----blocks-cases-close)
      


# 📓 Command Reference


    

    
    

# [`shellpen -- blocks functions`](/api/shellpen/--/blocks/functions)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="4"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command4="$1"
shift
case "$__shellpen__mainCliCommands_command4" in
  "close")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- blocks functions open`](/api/shellpen/--/blocks/functions/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- blocks functions close`](/api/shellpen/--/blocks/functions/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
then
  shellpen }
fi
_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen -- blocks closeAll`](/api/shellpen/--/blocks/closeAll)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
shellpen -- blocks cases close
shellpen -- blocks functions close
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -- blocks options`](/api/shellpen/--/blocks/options)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="4"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command4="$1"
shift
case "$__shellpen__mainCliCommands_command4" in
  "close")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- blocks options open`](/api/shellpen/--/blocks/options/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- blocks options close`](/api/shellpen/--/blocks/options/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
# Close existing option, if open
if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
then
  shellpen append writeln ";;"
  shellpen indent--
fi
_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen -- blocks cases`](/api/shellpen/--/blocks/cases)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="4"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command4="$1"
shift
case "$__shellpen__mainCliCommands_command4" in
  "close")
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- blocks cases open`](/api/shellpen/--/blocks/cases/open)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- blocks cases close`](/api/shellpen/--/blocks/cases/close)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
then
  shellpen esac
fi
_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
      
{% endraw %}
