CLASS zcl_travel_helper_24 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: validate_customer
      IMPORTING iv_customer_id      TYPE /dmo/customer_id
      RETURNING VALUE(rv_exists)    TYPE abap_bool.

    METHODS: get_booking_status
      IMPORTING iv_status           TYPE /dmo/booking_status_text
      RETURNING VALUE(rv_status)    TYPE /dmo/booking_status.

    METHODS: get_sightseeing_tips
      IMPORTING iv_city                       TYPE /dmo/city
      RETURNING VALUE(rv_sightseeing_tips)    TYPE /dmo/description.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_travel_helper_24 IMPLEMENTATION.

  METHOD validate_customer.
    SELECT SINGLE
       FROM /dmo/customer
       FIELDS @abap_true AS line_exists
       WHERE customer_id = @iv_customer_id
       INTO @rv_exists.
  ENDMETHOD.

  METHOD get_booking_status.
    CASE iv_status.
      WHEN 'Booked'.
        rv_status = 'B'.
      WHEN 'New'.
        rv_status = 'N'.
      WHEN 'Cancelled'.
        rv_status = 'X'.
    ENDCASE.
  ENDMETHOD.

  METHOD get_sightseeing_tips.
    " Pendiente — se conecta al ABAP AI SDK en la clase 3.
  ENDMETHOD.

ENDCLASS.

