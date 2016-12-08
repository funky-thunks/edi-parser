{-# LANGUAGE OverloadedStrings #-}

---- Machine generated code.
---- Output of edi-parser-scaffolder

module Text.Edifact.D01B.Simples.S8053
  ( simple8053
  ) where

import           Text.Edifact.Parsing
import           Text.Edifact.Types   (Value)

-- | Derived from this specification:
--
-- > *    8053  Equipment type code qualifier                           [C]
-- >
-- >      Desc: Code qualifying a type of equipment.
-- >
-- >      Repr: an..3
-- >
-- >      AA    Ground equipment
-- >               Ground equipment being fuelled or serviced.
-- >
-- >      AB    Chain
-- >               Chain used in the securing of cargo.
-- >
-- >      AD    Temperature recorder
-- >               Temperature recorder to provide a record of the actual
-- >               temperature.
-- >
-- >      AE    Body trailer
-- >               The part of the vehicle where the cargo is loaded.
-- >
-- >      AG    Slipsheet
-- >               A cardboard platform used for holding product for
-- >               storage or transportation.
-- >
-- >      AH    No special equipment needed
-- >               A code to indicate that there is no special equipment
-- >               needed.
-- >
-- >      AI    Vessel hold
-- >               A compartment forming part of a transport vessel.
-- >
-- >      AJ    Flat rack
-- >               Type of open container used for carrying objects.
-- >
-- >      AK    Aircraft
-- >               To indicate that the equipment is an aircraft.
-- >
-- >      AL    Medical device
-- >               A device used for medical purposes.
-- >
-- >      AM    Refrigerated container
-- >               A refrigerated (reefer) container that is actively
-- >               cooling the product.
-- >
-- >      AN    Synthetic pallet 80*120cm
-- >               A pallet with standard dimensions 80*120 centimetres
-- >               made of synthetic material.
-- >
-- >      AO    Synthetic pallet 100*120cm
-- >               A standard pallet with standard dimensions 100*120
-- >               centimetres made of synthetic material.
-- >
-- >      AP    Clothing hanger rack
-- >               Equipment used to store and transport clothing in a
-- >               hanging position.
-- >
-- >      AQ    Road/rail trailer
-- >               Trailer designated for combined road/rail use.
-- >
-- >      AT    Overhang wagon
-- >               Empty rail wagon added to the loaded wagons, when goods
-- >               are longer than the loaded wagon.
-- >
-- >      BL    Blocks
-- >               A piece of equipment that is normally a piece of wood to
-- >               fix cargo (e.g. coils) during transport.
-- >
-- >      BPN   Box pallet non-exchangeable
-- >               A box pallet which cannot be exchanged.
-- >
-- >      BPO   Truck being transported
-- >               A road vehicle capable of carrying goods which is being
-- >               carried on another means of transport.
-- >
-- >      BPP   Truck and trailer combination being transported
-- >               A road vehicle capable of carrying goods with an
-- >               attached trailer which is being carried on another means
-- >               of transport.
-- >
-- >      BPQ   Tractor and trailer being transported
-- >               A trailer accompanied by a self-propelling tractor unit
-- >               which is being carried on another means of transport.
-- >
-- >      BPY   Box pallet EUR Y non exchangeable
-- >               Self explanatory.
-- >
-- >      BR    Barge
-- >               Flat bottomed inland cargo vessel for canals and rivers
-- >               with or without own propulsion for the purpose of
-- >               transported goods. (Synonym: Lighter).
-- >
-- >      BX    Boxcar
-- >               An enclosed railway goods wagon.
-- >
-- >      CH    Chassis
-- >               A wheeled carriage onto which an ocean container is
-- >               mounted for inland conveyance.
-- >
-- >      CN    Container
-- >               Equipment item as defined by ISO for transport. It must
-- >               be of: A) permanent character, strong enough for
-- >               repeated use; B) designed to facilitate the carriage of
-- >               goods, by one or more modes of transport, without
-- >               intermediate reloading; C) fitted with devices for its
-- >               ready handling, particularly.
-- >
-- >      DPA   Deadlight (panel)
-- >               A set of panels fixed inside a porthole.
-- >
-- >      EFP   Exchangeable EUR flat pallet
-- >               Self explanatory.
-- >
-- >      EYP   Exchangeable EUR Y box pallet
-- >               Self explanatory.
-- >
-- >      FPN   Flat pallet EUR non exchangeable
-- >               Self explanatory.
-- >
-- >      FPR   Flat pallet (railway property) non-exchangeable
-- >               A non-exchangeable flat pallet owned by a railroad.
-- >
-- > X    FSU   Forked support
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      LAR   Lashing rope
-- >               A rope for lashing cargo.
-- >
-- >      LU    Load/unload device on equipment
-- >               A mechanical device used in the loading and/or unloading
-- >               of cargo into and from transport equipment.
-- >
-- >      MPA   Movable panel
-- >               A panel which can be moved.
-- >
-- >      PA    Pallet
-- >               A platform on which goods can be stacked in order to
-- >               facilitate the movement by a forklift or sling.
-- >
-- >      PBP   Identified private box pallet
-- >               A box pallet identified as being privately owned.
-- >
-- >      PFP   Identified private flat pallet
-- >               A flat pallet identified as being privately owned.
-- >
-- >      PL    Platform
-- >               A piece of equipment normally having a flat surface, or
-- >               prepared for carrying cargo with a specific shape.
-- >
-- >      PPA   Protecting panel
-- >               A panel used for protection.
-- >
-- >      PST   Portable stove
-- >               A portable heating unit.
-- >
-- >      RF    Flat car
-- >               A railway wagon without raised sides or ends.
-- >
-- >      RG    Reefer generator
-- >               A generator used to control the temperature in
-- >               temperature-controlled transport equipment.
-- >
-- >      RGF   Ground facility
-- >               Storage tank or facility capable of receiving shipment
-- >               of goods or commodity.
-- >
-- >      RO    Rope
-- >               Rope used in the securing of cargo.
-- >
-- >      RR    Rail car
-- >               To identify that the equipment is a rail car.
-- >
-- > X    SCA   Small container category A
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    SCB   Small container category B
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    SCC   Small container category C
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- > X    SFA   Stiffening ring of frame
-- >               Self explanatory.
-- >
-- >            Note:
-- >               1. This code value will be removed effective with
-- >               directory D.04B.
-- >
-- >      SPP   Identified special pallet
-- >               A pallet identified as special.
-- >
-- >      STR   Strap
-- >               A narrow strip of flexible material.
-- >
-- >      SW    Swap body
-- >               Rectangular equipment unit without wheels, which can be
-- >               mounted on a chassis or positioned on legs.
-- >
-- >      TE    Trailer
-- >               A vehicle without motive power, designed for the
-- >               carriage of cargo and to be towed by a motor vehicle.
-- >
-- >      TP    Tarpaulin
-- >               Waterproof material, e.g. canvas, to spread over cargo
-- >               to protect it from getting wet.
-- >
-- >      TS    Tackles
-- >               [8030] Identification marks and numbers of loading
-- >               tackle used (sheets, ropes, chains, etc.), as specified
-- >               in DCU 9 to CIM Article 13; and of containers, as
-- >               specified in Articles 5 and 10 of Annex III to CIM (CIM
-- >               17).
-- >
-- >      TSU   Tarpaulin support
-- >               A device to support a tarpaulin.
-- >
-- >      UL    ULD (Unit load device)
-- >               An aircraft container or pallet.
simple8053 :: Parser Value
simple8053 = simple "8053" (alphaNumeric `upTo` 3)