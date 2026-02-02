{-# LANGUAGE EmptyDataDecls, RankNTypes, ScopedTypeVariables #-}

module SysDaemon(Event(..), Daemon_state(..), transition) where {

import Prelude ((==), (/=), (<), (<=), (>=), (>), (+), (-), (*), (/), (**),
  (>>=), (>>), (=<<), (&&), (||), (^), (^^), (.), ($), ($!), (++), (!!), Eq,
  error, id, return, not, fst, snd, map, filter, concat, concatMap, reverse,
  zip, null, takeWhile, dropWhile, all, any, Integer, negate, abs, divMod,
  String, Bool(True, False), Maybe(Nothing, Just));
import Data.Bits ((.&.), (.|.), (.^.));
import qualified Prelude;
import qualified Data.Bits;

data Event = IncomingRequest | ProcessingComplete | Reset;

data Daemon_state = Idle | Processing | Error;

transition :: Daemon_state -> Event -> Daemon_state;
transition Idle IncomingRequest = Processing;
transition Processing ProcessingComplete = Idle;
transition uu Reset = Idle;
transition Processing IncomingRequest = Error;
transition Error IncomingRequest = Error;
transition Error ProcessingComplete = Error;
transition Idle ProcessingComplete = Idle;

}

