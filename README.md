# 学習用サンプル アプリケーション baukis業務管理アプリ
## 開発環境のカスタマイズ
- 以下を追加 Dockerfile
```Dockerfile
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install nodejs
```
- asset pipelineを利用しない。webpackerを使用する。

## 学習内容のメモ
### rspec
#### rspecのマッチャー
- to / not_to / to_not
- - to: 〜であること。
- - to_not/not_to: 〜で無いこと。（to_notとnot_toはどちらも同じ）
- eq
- - 等しい
- be
- - 同じインスタンスかどうか（eqより制限が厳しい）
- change + from / to /by
- - expect{ X }.to change{ Y }.from(A).to(B) ＝ 「X すると Y が A から B に変わることを期待する」
- - expect{ X }.to change{ Y }.by(A) ＝ 「X すると Y が A に変わることを期待する」
- include
- - 配列に～が含まれていること
- raise_error
- - エラーが起きることを期待する
- be_within + of
- - be_within(Y).of(X) ：「数値 X がプラスマイナス Y の範囲内に収まっていること」
