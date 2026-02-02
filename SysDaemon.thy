theory SysDaemon
  imports Main
begin

(* 1. Define the possible states of our Daemon *)
datatype daemon_state = Idle | Processing | Error

(* 2. Define the types of events the daemon handles *)
datatype event = IncomingRequest | ProcessingComplete | Reset

(* 3. The State Transition Function *)
fun transition :: "daemon_state ⇒ event ⇒ daemon_state" where
  "transition Idle IncomingRequest = Processing" |
  "transition Processing ProcessingComplete = Idle" |
  "transition _ Reset = Idle" |
  "transition Processing IncomingRequest = Error" | (* Overload error *)
  "transition state _ = state"

(* 4. Prove a safety property: A Reset always returns us to Idle *)
lemma reset_safety: "transition s Reset = Idle"
  apply (cases s)
   apply auto
  done



export_code transition Idle Processing Error IncomingRequest Reset in Haskell
  module_name SysDaemon
  file_prefix "./daemon_export"

end

