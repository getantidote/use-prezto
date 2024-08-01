# use-prezto

> A plugin to make using Prezto with antidote seamless

The Zsh plugin manager [antidote][antidote] can be used to load subplugins/submodules, such as those included in frameworks like [Prezto][prezto] and Oh-My-Zsh. However, it doesn't have specific logic to treat these popular Zsh frameworks different than any other plugin. With projects like Prezto that assume they aren't loaded any way other than the documented default, that can be a problem.

Since [antidote][antidote] is intended to be a general-purpose, high performance Zsh plugin manager without added complexity or special handling of frameworks like Prezto, this simple plugin serves as a bridge. It's not strictly necessary to use [use-prezto](https://github.com/getantidote/use-prezto) with antidote, but it really helps, and is highly recommended.

## How do I use it?

Simply include this plugin FIRST, at the top of your antidote `${ZDOTDIR:-$HOME}/.zsh_plugins.txt` file. To do that, add this line:

```zsh
getantidote/use-prezto
```

It's that easy. Now, you can use Prezto modules without worry.

## Performance

__Q:__ Is this fast?
<br/>
__A:__ Absolutely! With antidote, I'm committed to making sure Zsh users have a speedy shell. You can run benchmarks for yourself with [zsh-bench].

## Troubleshooting

__Q:__ Do I need to use this plugin if I'm using antidote and Prezto?
</br>
__A:__ Not strictly, but this plugin is now the officially supported way to use antidote correctly with Prezto.

__Q:__ What if I find an Prezto module that doesn't work?
</br>
__A:__ [Submit an issue here](https://github.com/getantidote/use-prezto/issues). Prezto specific issues won't be fixed within antidote itself, but this project aims to support every Prezto module with antidote.

## Examples

There is a sample [ZDOTDIR project](https://github.com/getantidote/zdotdir/tree/prezto) included with antidote which shows many examples.

Here's a more complete .zsh_plugins.txt you can use as a starter config.

```zsh
#
# ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
#

# If you use Prezto with antidote, load this plugin FIRST to set things up so you
# don't have to worry about whether Prezto will work correctly.
getantidote/use-prezto

# TODO...

# ... etc ...
```

## Differences

A quick note on differences in behavior between Prezto and use-prezto:

- TODO...

[antidote]:   https://github.com/mattmc3/antidote
[omz]:        https://github.com/ohmyzsh/ohmyzsh
[prezto]:     https://github.com/sorin-ionescu/prezto
[zsh-bench]:  https://github.com/romkatv/zsh-bench
