CLASS zcl_test_run_jamg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_run_jamg IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    "Aquí como tenemos un side effect que es un trigger al campo quantity
    "se actualiza los datos en FIORI automaticamente
    MODIFY ENTITIES OF ZBGPFR_InventoryTP_006
      ENTITY Inventory
        UPDATE FIELDS ( Quantity )
          WITH VALUE #(  ( uuid = 'F69DB30E9A721FD0B3F4F0F53EF2155D' Quantity = 2 )  )
     REPORTED DATA(lt_rep)
     FAILED DATA(lt_fa).

    COMMIT ENTITIES.
  ENDMETHOD.

ENDCLASS.
