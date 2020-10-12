# worldmapbackground

Generates a world map and sets it as the Lubuntu desktop background.

![Example](https://github.com/nonoo/worldmapbackground/raw/main/example.jpg)

Run the script periodically using crontab. Example:

```
# m h  dom mon dow   command
  * *  *   *   *     /usr/local/src/worldmapbackground/worldmapbackground.sh &>/dev/null
```
