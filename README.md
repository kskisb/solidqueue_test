# SolidQueue 定期的なタスクの実行について

### Rails へのアクセス
```
$ docker-compose run web bash
```

### recurring task
`config/solid_queue.yml` にて次のように指定
```
- polling_interval: 1
      batch_size: 500
      recurring_tasks:
        my_periodic_job:
          class: TestJob
          schedule: every second # 毎秒
```

### schedule: の指定方法(例)
| 文字列           | 意味                                    |
|------------------|-----------------------------------------|
| every second     | 毎秒                                    |
| every minute     | 毎分                                    |
| @hourly          | 毎時0分                                |
| @midnight        | 毎日0時                                |
| @daily           | 毎日0時                                |
| @monthly         | 毎月1日の0時                            |
| @weekly          | 毎週日曜日の0時                         |
| @yearly          | 毎年1月1日の0時                         |
| * * * * * *      | 毎秒                                    |
| * * * * *        | 毎分                                    |
| 5 * * * *        | 毎時5分                                 |
| 0 0 * * *        | 毎日0時                                 |
| 0 22 * * 1-5     | 平日の22時                              |
| 0 22 * * mon-fri | 平日の22時                              |
| 23 0-23/2 * * *  | 0分から23分までの間、2時間ごとの分毎  |
| 0 0 L * *        | 月末の0時                               |
| 0 0 1-7 * 2      | 月曜日から日曜日までの1日から7日までの間、毎週火曜日の0時  |
| 0 5 * * mon#1    | 月曜日の1番目の0時                      |
| 0 6 * * 5#4,5#5  | 月曜日の4番目と5番目の金曜日の0時       |
| 0 7 * * fri#-1   | 月の最後の金曜日の0時                   |
| 0 7 * * 5#L      | 月の最後の金曜日の0時                   |
| 0 23 * * mon#2,tue | 月曜日の2番目と毎週火曜日の23時        |
| 15/30 * * * *    | 15分から59分まで、30分ごとに毎時      |
| sun%2            | 奇数番目の日曜日の0時                  |
| tue%3+2          | 火曜日と水曜日の3週ごとの2日目の0時   |
| 5 * * * * *      | 毎分の5秒                               |
| 15 6 * * * *     | 毎時6分15秒                             |
| * 0 * * * *      | 毎分の0秒                               |

参考：https://github.com/floraison/fugit
