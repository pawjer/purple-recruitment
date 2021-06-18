# Pixel species growth simulation 
* Ruby version
`3.0.0`

#### Places you should start:
- `/app/models/pixel.rb`
- `/app/models/pixels_family.rb`
- `/app/services/family_life_simulation.rb`
- `/app/logic/pixel_multiplication_logic.rb`
- `/test/model/*`
- `/test/services/*`
- `/test/logic/*`

#### To easier use I've prepared script called:
`pixel_family_simulation.rb` at the root directory. Run it simply by:

- `ruby pixel_family_simulation.rb`

#### To follow each step of family growth you could most be interested in the PixelsFamily model.
- use `rails console`
- create a family: 
   - `family = PixelsFamily.new([Pixel.new, Pixel.new])`
- create next generations by:
    - `family.create_generation`
        OR
    - `family.create_generation(randomize: true)`