#docker-fail2ban

Simple docker contains a complete installation of fail2ban on Debian Jessie.

This first version contains fail2ban-0.8.13-1.

###Usage
To run it:
```
$ docker run -d \
-v /var/log:/var/log \
superitman/fail2ban:latest
```
    
If you want to use your own jail.local and your own filters:
```
$ docker run -d \
-v /path/to/filters.d/custom_filter.conf:/etc/fail2ban/filter.d/custom_filter.conf \
-v /path/to/jail.local:/etc/fail2ban/jail.local \
-v /var/log:/var/log \
superitman/fail2ban:latest
```

###Lots of filters and actions

If you have a lot of custom rules, build your own docker image
```
$ git clone https://github.com/superitman/docker-fail2ban.git
$ cd docker-fail2ban
```
Copy your filters in filter.d folder, your rules in rules.d and your jail.local in the current folder.

Then build your image
```
$ docker build -t your-custom-fail2ban .
```

When your image is ready, run it:
```
$ docker run -d \
-v /var/log:/var/log \
your-custom-fail2ban
```