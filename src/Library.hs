module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero

type CriterioPropina = Number -> Number


----------------------------------------------------
-- COMENZANDO MODELANDO LOS CRITERIOS CON STRINGS --
----------------------------------------------------

--Version 1
-- cuantoPagar:: Number -> String -> String -> Number
-- cuantoPagar precio "TioCarlos" mozo = precio + criterioPropinaTioCarlos precio mozo
-- cuantoPagar precio "TioCarlos" mozo = precio + criterioPropinaTioCarlos precio mozo

-- cuantoPagar precio "recomendada" _ = precio + criterioPropinaRecomendada precio
-- cuantoPagar precio "MrPink" _ = precio + criterioPropinaMrPink precio 
-- cuantoPagar precio "conservadora" _ = precio + criterioPropinaConservadora precio




--------------------------------------------------
-- LUEGO MODELAMOS LOS CRITERIOS COMO FUNCIONES --
--------------------------------------------------

--Version 2
cuantoPagar :: Number -> CriterioPropina -> Number
cuantoPagar precio criterioPropina = precio + criterioPropina precio

criterioPropinaTioCarlos :: String -> CriterioPropina
criterioPropinaTioCarlos "Carlos" precio = 2 * criterioPropinaRecomendada precio 
criterioPropinaTioCarlos _ precio = 0.5 * criterioPropinaRecomendada precio 

criterioTioCarlosConfirmado :: CriterioPropina
criterioTioCarlosConfirmado = criterioPropinaTioCarlos "Carlos"

criterioPropinaRecomendada ::CriterioPropina
criterioPropinaRecomendada = (*0.1)

criterioPropinaMrPink :: CriterioPropina
criterioPropinaMrPink _ = 0

criterioPropinaConservadora :: CriterioPropina
criterioPropinaConservadora precio 
    | esImpar precio = 25
    | otherwise = 20

esImpar :: Number -> Bool
esImpar = (odd . truncate)




------------------------------------------------------
-- ESTAS SON LAS SOLUCIONES QUE ESTUVIERON MANDANDO --
------------------------------------------------------

-- -- Solucion C
-- type Monto = Number 
-- type Propina = Number
-- type Nombre = String 

-- cuantoPagar :: Monto -> String -> Number
-- cuantoPagar precio "recomendada" = precio + criterioRecomendado precio
-- cuantoPagar precio "MrPink" = precio + criterioMrPink precio
-- cuantoPagar precio "conservadores" = precio + criterioConservador precio
-- cuantoPagar precio


-- criterioRecomendado :: Monto -> Number
-- criterioRecomendado precio = (*0.1)

-- criterioMrPink :: Monto -> Number 
-- criterioMrPink precio = precio * 0

-- criterioConservador 

-- -- Solucion E
-- calculoPorcentaje :: Nombre -> Monto -> Propina
-- calculoPorcentaje "recomendada" = (*0.1) 

-- esRata :: Nombre -> Monto -> Propina
-- esRata "Mr. Pink" monto = (*0) monto

-- criterioPropinaRecomendada :: Monto -> Nombre -> Propina
-- criterioPropinaRecomendada monto Nombre 
--     | condicion = calculoPorcentaje nombre monto
--     | condicion = esRata nombre monto


-- --
-- criterioPropina :: Number -> Number -> Number
-- criterioPropina "MrPink" precio = (*0) precio
-- criterioPropina "recomendada" precio = (*0.1) precio
-- criterioPropina "conservadoras" precio = 20 + 5*precio/2 == 0

-- --
-- cuantoPagar :: Number -> String -> Number
-- cuantoPagar costoComida "recomendada" = costoComida + critPropinaRecomendada costoComida
-- cuantoPagar costoComida "MrPink" = costoComida
-- cuantoPagar costoComida "conservador" 
--     | odd . truncate (costoComida) = 25
--     | otherwise = 20

-- critPropinaRecomendada :: Number -> Number
-- critPropinaRecomendada  = (* 0.1)


-- criterioConservadorPropina::CriterioPropina
-- criterioConservadorPropina costoComida|not(even costoComida)=20 + 5
--                                       |even costoComida=20
