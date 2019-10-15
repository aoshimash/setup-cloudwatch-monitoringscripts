# setup-cloudwatch-monitoringscripts

CloudWatch モニタリングスクリプトをインストールして、cronに登録するまでの作業を自動化する。
設定値とか変更できないから汎用性はない。Amazon Linuxのみ対応。

[これ](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/mon-scripts.html)をやってるだけ。

## 準備

- 監視用IAMユーザーの作成（アクセスIDとシークレットキーを控えておく）

## 使い方

対象のEC2インスタンスで以下を実行。

``` console
$ wget https://github.com/aoshimash/setup-cloudwatch-monitoringscripts/archive/master.zip
$ unzip master.zip
$ cd setup-cloudwatch-monitoringscripts-master
$ ./setup.sh
AWSAccessKeyID: <アクセスキーID>
AWSSecretKey: <シークレットキー>
```

AWSマネジメントコンソールの、CloudWatch > メトリクス > すべてのメトリクス > カスタム名前空間 > Linuxシステム から、これらのメトリクスを確認できる。
