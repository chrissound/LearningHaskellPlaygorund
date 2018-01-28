{-# LANGUAGE FlexibleInstances #-}

data MyEither b a = MyLeft a | MyRight b

instance Functor (MyEither b) where
  fmap f (MyLeft a)  = MyLeft $ f a
  fmap _ (MyRight a) = MyRight a


---

data Company a c b = Combo a c | Single b

instance Functor (Company a c) where
  fmap f (Single b)  = Single $ f b
  fmap _ (Combo a b) = Combo a b

---

data More b a = L a b a | R b a b deriving (Eq, Show)

instance Functor (More x) where
  fmap f (L a b a') = L (f a) b (f a')
  fmap f (R b a b') = R b (f a) b'

---

data Quant a b = Finance | Desk a | Bloor b

instance Functor (Quant a) where
  fmap _ (Finance) = Finance
  fmap _ (Desk a)  = Desk a
  fmap f (Bloor b) = Bloor $ f b

---

data Kz a b = Kz a

instance Functor (Kz a) where
  fmap _ (Kz a) = Kz a

---

newtype Flip f a b = Flip (f b a) deriving (Eq, Show)

data K a b = K a deriving (Eq, Show)

instance Functor (Flip K a) where
  fmap f (Flip (K b)) = Flip . K $ f b

---

data EvilGoateeConst a b = GoatyConst b

instance Functor (EvilGoateeConst a) where
  fmap f (GoatyConst b) = GoatyConst $ f b


---

data LiftItOut f a = LiftItOut (f a)

instance Functor f => Functor (LiftItOut f) where
  fmap f (LiftItOut x) = LiftItOut $ fmap f x

---

data Parappa f g a = Parappa (f a) (g a)

instance (Functor f, Functor g) => Functor (Parappa f g) where
  fmap f (Parappa x y) = Parappa (fmap f x) (fmap f y)

---

data Notorious g o a t = Notorious (g o) (g a) (g t)

instance (Functor g) => Functor (Notorious g o a) where
  fmap f (Notorious x y z) = Notorious (x) (y) (fmap f z)

---

data List a = Nil | Cons a (List a)
instance Functor (List) where
  fmap _ (Nil) = Nil
  fmap f (Cons a b) = Cons ( f a ) (fmap f b)

---

data GoatLord a = NoGoat | OneGoat a | MoreGoats (GoatLord a) (GoatLord a) (GoatLord a)
instance Functor (GoatLord) where
  fmap _ NoGoat = NoGoat
  fmap f (OneGoat a) = OneGoat $ f a
  fmap f (MoreGoats a b c) = MoreGoats (fmap f a) (fmap f b) (fmap f c)

---

data TalkToMe a = Halt | Print String a | Read (String -> a)
instance Functor TalkToMe where
  fmap _ Halt = Halt
  fmap f (Print s a) = Print s $ f a
  fmap f (Read a) = Read $ f . a


main :: IO ()
main = do
  print $ (fmap (+1) (L 1 2 3) :: More Integer Integer)
  print $ (fmap (+1) (R 1 2 3) :: More Integer Integer)
  print $ (K 5 :: K Integer Integer)
  print $ Flip (K 5 :: K Integer Integer)
  print $ fmap (+1) $ Flip (K 5 :: K Integer Integer)
  print "Completed"
