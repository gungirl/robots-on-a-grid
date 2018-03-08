module LowLevelLang
 where

data Instruction = MoveLeft | MoveRight | MoveUp | MoveDown | PickCoin | DropCoin | CheckBlockLeft | CheckBlockRight | CheckBlockUp | CheckBlockDown | CheckCoins | CheckCoinsRight | CheckCoinsLeft | CheckCoinsUp | CheckCoinsDown | CheckRobotLeft | CheckRobotRight | CheckRobotUp | CheckRobotDown | CheckEdgeLeft | CheckEdgeRight | CheckEdgeBottom | CheckEdgeTop deriving (Eq, Show)

 --Destroy block if any, define robot align , different alignments , diagonal robot movement , move block left right front , paisa khaane waala robot Vanish ,   

data Type = TypeNum | TypeBool | TypeInst | TypeFunc FunctionType deriving (Eq, Show)

type FunctionType = [Type]

data Statement = Assign Var AssignValue | IfStmt BExp (Int, Int) [Statement] [Statement] | Call Int FunctionRef | Return (Maybe ReturnVal) | SystemCall Int Instruction deriving (Eq, Show)
-- return can have empty value (Nothing) also

data Var = Var String deriving (Show, Eq)

data AssignValue = AVal Aexp | BVal BExp | Inst Int Instruction | CallVal Int FunctionRef | VarVal Var deriving (Eq, Show)

data Aexp = Add Aexp Aexp | Mult  Aexp Aexp | Sub Aexp Aexp | ArithVar Var | ArithVal Int deriving (Eq, Show) -- addedl
data BExp = Or BExp BExp | And BExp BExp | Not BExp | BVar Var | BoolVal Bool | Gt Aexp Aexp | Lt Aexp Aexp | Equ Aexp Aexp | Leq Aexp Aexp | Geq Aexp Aexp deriving (Eq , Show)

data ConstValue = ValNum Int | ValBool Bool | ValInst Instruction | ValFunc Var [(Var , ConstValue)] deriving (Eq, Show)

data ReturnVal = RetConst ConstValue | RetVar Var deriving (Eq, Show)

type Bindings = [(Var, ReturnVal)]
type Argument = ReturnVal

data FunctionRef = FunctionRef Var [Argument] deriving (Eq, Show) --Var contains the name of the function

type State = [(Var, ConstValue)]


data Function = Function {
  functionType :: FunctionType,
  functionName :: String,
  functionParameters :: [(Var, Type)],
  functionBody :: [Statement]
} deriving (Show, Eq)

type Program = [Function]
