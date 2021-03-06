@gpg_no_pw_hmac = (
    ### no password GPG testing
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'complete cycle (tcp/22 ssh)',
        'function' => \&spa_cycle,
        'cmdline'  => "$default_client_gpg_args_no_homedir "
            . "--gpg-home-dir $gpg_client_home_dir_no_pw "
            . "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'fw_rule_created' => $NEW_RULE_REQUIRED,
        'fw_rule_removed' => $NEW_RULE_REMOVED,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'complete cycle (tcp/23 telnet)',
        'function' => \&spa_cycle,
        'cmdline'  => "LD_LIBRARY_PATH=$lib_dir $valgrind_str " .
            "$fwknopCmd -A tcp/23 -a $fake_ip -D $loopback_ip --get-key " .
            "$local_key_file --verbose --verbose " .
            "--gpg-recipient-key $gpg_server_key " .
            "--gpg-signer-key $gpg_client_key " .
            "--gpg-home-dir $gpg_client_home_dir_no_pw " .
            "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'fw_rule_created' => $NEW_RULE_REQUIRED,
        'fw_rule_removed' => $NEW_RULE_REMOVED,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'complete cycle (tcp/9418 git)',
        'function' => \&spa_cycle,
        'cmdline'  => "LD_LIBRARY_PATH=$lib_dir $valgrind_str " .
            "$fwknopCmd -A tcp/9418 -a $fake_ip -D $loopback_ip --get-key " .
            "$local_key_file --verbose --verbose " .
            "--gpg-recipient-key $gpg_server_key " .
            "--gpg-signer-key $gpg_client_key " .
            "--gpg-home-dir $gpg_client_home_dir_no_pw " .
            "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'fw_rule_created' => $NEW_RULE_REQUIRED,
        'fw_rule_removed' => $NEW_RULE_REMOVED,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'complete cycle (tcp/60001 git)',
        'function' => \&spa_cycle,
        'cmdline'  => "LD_LIBRARY_PATH=$lib_dir $valgrind_str " .
            "$fwknopCmd -A tcp/60001 -a $fake_ip -D $loopback_ip --get-key " .
            "$local_key_file --verbose --verbose " .
            "--gpg-recipient-key $gpg_server_key " .
            "--gpg-signer-key $gpg_client_key " .
            "--gpg-home-dir $gpg_client_home_dir_no_pw " .
            "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'fw_rule_created' => $NEW_RULE_REQUIRED,
        'fw_rule_removed' => $NEW_RULE_REMOVED,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'complete cycle (udp/53 dns)',
        'function' => \&spa_cycle,
        'cmdline'  => "LD_LIBRARY_PATH=$lib_dir $valgrind_str " .
            "$fwknopCmd -A udp/53 -a $fake_ip -D $loopback_ip --get-key " .
            "$local_key_file --verbose --verbose " .
            "--gpg-recipient-key $gpg_server_key " .
            "--gpg-signer-key $gpg_client_key " .
            "--gpg-home-dir $gpg_client_home_dir_no_pw " .
            "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'fw_rule_created' => $NEW_RULE_REQUIRED,
        'fw_rule_removed' => $NEW_RULE_REMOVED,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'replay attack detection',
        'function' => \&replay_detection,
        'cmdline'  => "$default_client_gpg_args_no_homedir "
            . "--gpg-home-dir $gpg_client_home_dir_no_pw "
            . "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'key_file' => $cf{'rc_hmac_b64_key'},
        'fatal'    => $NO
    },
    {
        'category' => 'GPG (no pw) HMAC',
        'subcategory' => 'client+server',
        'detail'   => 'detect replay #1 (GnuPG prefix)',
        'function' => \&replay_detection,
        'pkt_prefix' => 'hQ',
        'cmdline'  => "$default_client_gpg_args_no_homedir "
            . "--gpg-home-dir $gpg_client_home_dir_no_pw "
            . "--rc-file $cf{'rc_hmac_b64_key'}",
        'fwknopd_cmdline'  => $default_server_gpg_args_no_pw_hmac,
        'replay_positive_output_matches' => [qr/Data\sis\snot\sa\svalid\sSPA\smessage\sformat/],
        'fatal'    => $NO
    },

);
