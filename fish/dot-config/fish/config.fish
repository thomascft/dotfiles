if status is-interactive
    # Commands to run in interactive sessions can go here
	set -gx EDITOR nvim
	set -gx MANPAGER "nvim +Man!"
	set -U fish_greeting
	fish_vi_key_bindings
end

function fish_mode_prompt

end

function vi_mode_segment -a mode color
	echo -n -s (set_color $color)'' 
	echo -n -s (set_color --bold -r $color) $mode (set_color normal)
	echo -n -s (set_color $color)(set_color -b brblack) '' (set_color normal)
end

function segment_mode
	switch $fish_bind_mode
		case default
			vi_mode_segment 'NORMAL' green
		case insert
			vi_mode_segment 'INSERT' blue
		case replace_one
			vi_mode_segment 'REPLACE' red
		case visual
			vi_mode_segment 'VISUAL' brmagenta
	end
end

function segment_login
	echo -n -s ' 󰀄 ' "$USER" "@" "$hostname"
end

function segment_pwd
	echo -s ' 󰉋 ' (prompt_pwd)
end

function fish_prompt --description 'Write out the prompt'

	set normal (set_color normal)

	echo -s (segment_mode) (set_color -b brblack)(segment_login) (segment_pwd) (set_color normal)(set_color brblack)'' (set_color normal)  ' % '
end
