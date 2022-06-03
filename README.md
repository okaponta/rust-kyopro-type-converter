# rust-kyopro-type-converter

ちょっと型を変換したいってときによくど忘れするので作成しました。  
よかったら使ってください！🌟もよければお願いします！

## 変換に対応している型たち

 - int (i32/u8なども入力として受け付けます)
 - char
 - alpha (アルファベットのことです)
 - str

## 対応表

| ↓from\to→ | int | char | alpha | str |
| --------- | --- | ---  | ----- | --- |
| int       | ×   | ○    |  ○    | ○   |
| char      | ○   | ×    |  ×    | ○   |
| alpha     | ○   | ×    |  ×    | ○   |
| str       | ○   | ○    |  ×    | ×   |

## Usage

 - 本リポジトリをクローンする
   - `git clone https://github.com/okaponta/rust-kyopro-type-converter.git`
 - function読み込み(コンソール立ち上げた初回のみ)
   - `source /path/to/repo/convert.sh`
 - コマンド実行
   - `cv int alpha`
   - 変換のソースがコマンドラインに出力され、**クリップボードにコピーされます**

## Demo

![rust-kyopro-type-converter-demo](https://user-images.githubusercontent.com/59508678/171935061-6d3c7146-0a1e-4eab-bc49-5be6fbea09eb.gif)

## FAQ

 - なんでシェルなの？
   - クリップボードにコピーとかしたかったのと、たいした内容じゃないのでシェル芸人して作りました
 - Windowsなんですが
   - たぶん以下で動きます。(動作確認してませんすみません)
   - `source /path/to/repo/convert-for-win.sh`
 - 変数名が自分のいつも設定しているものと異なるので変えたい
   - `default_var`のファイルを書き換えると変数名が変わります。
 - 毎回`source`と打って読み込むのめんどくさい
   - `.zshrc`に追加すればデフォルトで読み込まれます。
   - 自分は競プロするときに読み込む環境変数があるのでそこにこれもあわせて設定しています。
 - こんな機能がほしい/バグってる
   - IssueかPull Requestをお願いします！！
