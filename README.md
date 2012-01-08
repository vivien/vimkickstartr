     _    ___ __  ___   __ __ _       __   _____ __             __
    | |  / (_)  |/  /  / //_/(_)_____/ /__/ ___// /_____ ______/ /_
    | | / / / /|_/ /  / ,<  / // ___/ //_/\__ \/ __/ __ `/ ___/ __/
    | |/ / / /  / /  / /| |/ // /__/ ,<  ___/ / /_/ /_/ / /  / /_
    |___/_/_/  /_/  /_/ |_/_/ \___/_/|_|/____/\__/\__,_/_/   \__/

Usage
-----

Just copy this [vimrc](https://github.com/v0n/vim-kickstart/blob/master/vimrc)
into your `~/.vimrc`, and you're ready!

For the lazy:

    wget https://raw.github.com/v0n/vim-kickstart/master/vimrc -O ~/.vimrc

List every plugin names you want in `~/.vim-addons`. For instance:

    " My list of ViM addons
    snipmate-snippets
    supertab
    fugitive

On the next start, ViM will fetch the
[vim-addon-manager](https://github.com/MarcWeber/vim-addon-manager),
and install every plugin you've listed in your `~/.vim-addons` file.

See the VAM documentation for useful commands, such as `:UpdateAddons`!

Goal
----

Some of the main ideas:

* All your ViM config is in your .vimrc
* Pure VimL config (thanks to MarcWeber for [VAM](https://github.com/MarcWeber/vim-addon-manager)!)
* Should be flexible and work everywhere (no headache on configuration)
* Using a plugin should be as easy as adding its name to a file

Why not another "ViM distribution"?
-----------------------------------

There are several other ViM setups, like [Janus](https://github.com/carlhuda/janus)
or [spf13-vim](https://github.com/spf13/spf13-vim), but none will match
your needs exactly (it often includes many plugins you don't care
about). They often depends on a scripting language to install and manage
plugins. Moreover, having a `~/.vimrc.before`, a `~/.vimrc.after`, or
whatever, in addition to your `~/.vimrc`, sucks a lot.

Someone can say this vimrc is big, but who cares, ViM folding is
made for that (just open this vimrc with ViM to see how it looks) ;)
And another good point is that a single config file is more portable.

So the best solution is to get a nice prepared and documented vimrc as a
base, embedding simple support for plugin management, and tweak it to
fit your needs if necessary!

Contribution
------------

I'd like ViM KickStart to work on every platforms, and dealing well with
every ViM version (no crash or error because of dependencies or
whatever). I'd be glad to receive any feedback or contribution on
this config.
Feel free to send a message/request :)



Vivien Didelot <vivien@didelot.org>
