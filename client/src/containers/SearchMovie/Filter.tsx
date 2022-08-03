import { useState } from 'react';
import Select from 'react-dropdown-select';
import InputRange from 'react-input-range';

export default function Filter() {
  const [tag, setTag] = useState([{ name: 'all' }]);
  const [imbd, setImbd] = useState<any>({ min: 0, max: 10 });
  const [year, setYear] = useState<any>({ min: 1900, max: 2022 });

  return (
    <div className="filter">
      <div className="container">
        <div className="row">
          <div className="col-12">
            <div className="filter__content">
              <div className="filter__items">
                {/* filter item */}
                <div className="filter__item">
                  <span className="filter__item-label">Tag:</span>
                  <div className="filter__item-btn">
                    <Select
                      valueField="name"
                      labelField="name"
                      options={[{ name: '1' }, { name: '2' }]}
                      onChange={values => {
                        setTag(tag);
                      }}
                      multi={false}
                      values={tag}
                    />
                  </div>
                </div>
                {/* end filter item */}

                {/* filter item */}
                <div className="filter__item">
                  <span className="filter__item-label">Name:</span>
                  <div className="filter__item-btn">
                    <input className="input_name" />
                  </div>
                </div>
                {/* end filter item */}

                {/* filter item */}
                <div className="filter__item" id="filter__rate">
                  <span className="filter__item-label">IMBd:</span>
                  <InputRange
                    step={0.5}
                    formatLabel={undefined}
                    draggableTrack={false}
                    allowSameValues={false}
                    maxValue={10}
                    minValue={0}
                    value={imbd}
                    onChange={value => {
                      console.log(value);
                      setImbd(value);
                    }}
                    onChangeComplete={args => console.log(args)}
                  />
                </div>
                {/* end filter item */}

                {/* filter item */}
                <div className="filter__item" id="filter__year">
                  <span className="filter__item-label">RELEASE YEAR:</span>

                  <InputRange
                    maxValue={2022}
                    minValue={1900}
                    value={year}
                    step={1}
                    onChange={value => {
                      setYear(value);
                    }}
                  />
                </div>
                {/* end filter item */}
              </div>

              {/* filter btn */}
              <button className="filter__btn" type="button">
                apply filter
              </button>
              {/* end filter btn */}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
