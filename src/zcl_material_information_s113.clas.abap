CLASS zcl_material_information_S113 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-Product
      RETURNING
        VALUE(material_art) TYPE i_product-ProductType.
ENDCLASS.



CLASS zcl_material_information_S113 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.

* Quick Fix Replace deprecated object DTEL BOOLE_D with released object DTEL ABAP_BOOLEAN
* 10/14/2023 13:43:08 STUDENTH113
* Transport S4HK902802 Dev4S4C Exercises 3 - STUDENTH113
* Replaced Code:
*    DATA bool_tmp TYPE boole_d.

DATA bool_tmp TYPE ABAP_BOOLEAN .

* End of Quick Fix



* Quick Fix Replace 'SY-DATUM' with cl_abap_context_info=>get_system_date( ).
* 10/14/2023 13:43:08 STUDENTH113
* Transport S4HK902802 Dev4S4C Exercises 3 - STUDENTH113
* Replaced Code:
*    production_date = sy-datum.

PRODUCTION_DATE = cl_abap_context_info=>get_system_date( ).

* End of Quick Fix



* Quick Fix Replace 'OLD SQL' with NEW SQL.
* 10/14/2023 13:43:08 STUDENTH113
* Transport S4HK902802 Dev4S4C Exercises 3 - STUDENTH113
* Replaced Code:
*    SELECT SINGLE mtart FROM mara INTO CORRESPONDING FIELDS OF material WHERE matnr = matnr.

SELECT SINGLE FROM i_product fields ProductType WHERE Product = @MATNR INTO CORRESPONDING FIELDS OF @MATERIAL .

* End of Quick Fix



* Quick Fix Replace MOVE with an assignment.
* 10/14/2023 13:43:08 STUDENTH113
* Transport S4HK902802 Dev4S4C Exercises 3 - STUDENTH113
* Replaced Code:
*    MOVE material-mtart TO material_art.

    material_art = material-producttype.

* End of Quick Fix


  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_S113.
    material_info = NEW zcl_material_information_S113(  ).
    DATA(material_art) = material_info->get_material_art( 'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.

