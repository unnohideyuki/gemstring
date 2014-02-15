gemstring
=========

hyuki さん出題の CodeIQ 《ジェムストリング問題》むけに作成したコード

[CodeIQ に投稿したコード](http://uhideyuki.sakura.ne.jp/uDiary/?date=20140214) は、ミスってたので直しました。

辞書順の文字列ジェネレータだなということで、Ruby では Enumerator を用いて書いてみました。
Haskell 版は、その後で書いたもので、見かけは違いますが Ruby 版と同じです。（「同じ」はいい過ぎかな）

# 実行結果

Haskell 版：

    $ ghc gemgen.hs
    [1 of 1] Compiling Main             ( gemgen.hs, gemgen.o )
    Linking gemgen.exe ...
    
    $ ./gemgen.exe
    5578864439:eagcdfbe


Ruby 版：（まちがってる…）

    >ruby gemgen.rb
    gemgen.rb:32: warning: Enumerator.new without a block is deprecated; use Object#to_enum
    1283897143:eagcdfbe
