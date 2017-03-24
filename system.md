# 型無し算術式

## 項

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

```
v := true
     false
     nv

nv := 0
      succ nv
```

## 評価規則

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
