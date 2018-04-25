  package {'telnet-server':
    ensure => absent,
  }

    package {'rsh-server':
    ensure => absent,
  }

    package {'rsh':
    ensure => absent,
  }

    package {'ypbind':
    ensure => absent,
  }

    package {'ypserv':
    ensure => absent,
  }

    package {'tftp':
    ensure => absent,
  }

    package {'tftp-server':
    ensure => absent,
  }

    package {'talk':
    ensure => absent,
  }

    package {'talk-server':
    ensure => absent,
  }

    package {'xinetd':
    ensure => absent,
  }

    package {'chargen-dgram':
    ensure => absent,
  }

    package {'chargen-stream':
    ensure => absent,
  }

    package {'daytime-dgram':
    ensure => absent,
  }

    package {'daytime-stream':
    ensure => absent,
  }

    package {'echo-dgram':
    ensure => absent,
  }

    package {'echo-stream':
    ensure => absent,
  }

    package {'tcpmux-server':
    ensure => absent,
  }

       package {'xorg-x11-libs':
        ensure => absent,
      }

  package {'avahi-daemon':
    ensure => absent,
  }

    package {'dhcp':
    ensure => absent,
  }

# NTP is handled via puppetlabs/ntp

# Postfix is handled via puppet/system

  service { [ telnet, vsftpd, login, rlogin, rsh, shell, tftp, cyrus-imap, dovecot, xfs, acpid, amd, anacron, apmd, arptables_jf, aprwatch, atd, autofs, avahi-daemon, avahi-dnsconfd, bpgd, bluetooth, bootparamd, capi, conman, cups, dc_client, dc_server, dhcdbd, dund, firstboot, gpm, haldaemon, hplip, irda, iscsi, isdn, kudzu, lm_sensors, mdmonitor, mdmpd, microcode_ctl, multipathd, netfs, netplugd, nfs, nfslock, nscd, pand, pcscd, portmap, rdisc, readahead_early, readahead_later, rpcgssd, rpcidmapd, rpcsvcgssd,rwhod, saslauthd, sendmail, setroubleshoot, smartd, smb, snmpd,snmptrapd,  'tog-pegasus',  tux, winbind, wine, 'wpa_supplicant', xend, xendomains, xinetd, ypbind, yppasswdd, ypserv, ypxfrd, 'yum-updatesd', zebra ]:
    ensure => stopped,
    enable => false,
    hasstatus => true,
  }

