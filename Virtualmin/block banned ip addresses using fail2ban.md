# Automatically Run Commands with Fail2Ban

To automatically run a command when an IP is banned by Fail2Ban, you can create a custom action. Here’s how you can set it up to run `iptables -I INPUT -s <ip-address> -j DROP` when an IP is banned.

## Steps

1. **Create a Custom Action Script**

    Create a new script file that will be executed by Fail2Ban. For example, `/etc/fail2ban/action.d/iptables-custom.conf`.

    ```bash
    sudo nano /etc/fail2ban/action.d/iptables-custom.conf
    ```

    Add the following content to this file:

    ```ini
    [Definition]

    actionstart = iptables -N f2b-<name>
                  iptables -A f2b-<name> -j RETURN
                  iptables -I INPUT -p <protocol> -j f2b-<name>

    actionstop = iptables -D INPUT -p <protocol> -j f2b-<name>
                 iptables -F f2b-<name>
                 iptables -X f2b-<name>

    actioncheck = iptables -n -L INPUT | grep -q 'f2b-<name>[ \t]'

    actionban = iptables -I INPUT -s <ip> -j DROP

    actionunban = iptables -D INPUT -s <ip> -j DROP
    ```

2. **Update Jail Configuration**

    Edit the Fail2Ban jail configuration file (e.g., `/etc/fail2ban/jail.local`) to use the new custom action. 

    ```bash
    sudo nano /etc/fail2ban/jail.local
    ```

    Add or update the relevant jail configuration to include your custom action. For example, to apply it to the SSH jail:

    ```ini
    [sshd]
    enabled  = true
    port     = ssh
    filter   = sshd
    logpath  = /var/log/auth.log
    maxretry = 5
    bantime  = 600
    action   = iptables-custom
    ```

3. **Restart Fail2Ban**

    Restart Fail2Ban to apply the changes.

    ```bash
    sudo systemctl restart fail2ban
    ```

## Explanation

- **actionstart**: Commands to execute when Fail2Ban starts.
- **actionstop**: Commands to execute when Fail2Ban stops.
- **actioncheck**: Command to check if the action is already in place.
- **actionban**: Command to execute when an IP is banned.
- **actionunban**: Command to execute when an IP is unbanned.

This setup ensures that whenever Fail2Ban bans an IP, it will also execute the specified `iptables` command to drop traffic from that IP.
