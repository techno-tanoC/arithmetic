# 型無し算術式

今回は以下のように定義する体系の評価器をHaskellで実装する

## 項

項(体系の表現の方法)は

* true
* false
* if
* 0
* succ
* pred
* iszero

のいずれかの組み合わせである

```
t := true
     false
     if t then t else t
     0
     succ t
     pred t
     iszero t
```

## 値

値(項の評価の最終結果となり得る項)は

* true
* false
* numeric value
  * 0
  * succ (numeric value)

のいずれかである

```
v := true
     false
     nv

nv := 0
      succ nv
```

## 評価規則

評価規則(評価の進め方)は以下のいずれかである。
外から以下の順番に探して、最初に見つかった評価規則で評価する。

`------`の意味は「上のように評価できるならば、下のように評価できる」

```
if true then t2 else t3 -> t2
```

```
if false then t2 else t3 -> t3
```

```
                   t1 -> t'1
-----------------------------------------------
if t1 then t2 else t3 -> if t'1 then t2 else t3
```

```
     t1 -> t'1
-------------------
succ t1 -> succ t'1
```

```
pred 0 -> 0
```

```
pred (succ nv1) -> nv1
```

```
     t1 -> t'1
-------------------
pred t1 -> pred t'1
```

```
iszero 0 -> true
```

```
iszero (succ nv1) -> false
```

```
        t1 -> t'1
-----------------------
iszero t1 -> iszero t'1
```
