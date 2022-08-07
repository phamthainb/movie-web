import { request, requestInter } from 'api/axios';
import API_URL from 'api/url';
import { TypeTag } from 'containers/MovieWatching/store/types';
import { clearParams } from 'helpers';
import { useEffect, useState } from 'react';
import Select from 'react-dropdown-select';
import InputRange from 'react-input-range';
import { useDispatch } from 'react-redux';
import { changeData } from './store/actions';

export default function Filter() {
  const [listTag, setListTag] = useState([]);
  const [clear, setClear] = useState(false);

  const [tag, setTag] = useState<any[]>([]);
  const [name, setName] = useState<string>('');
  const [imbd, setImbd] = useState<any>({ min: 0, max: 0 }); //duration
  const [year, setYear] = useState<any>({ min: 0, max: 0 });

  const dis = useDispatch();

  useEffect(() => {
    request({ method: 'GET', url: API_URL.TAG.GET }).then(res => {
      setListTag(
        res?.data?.map((k: TypeTag) => ({ name: k.name, value: k.id })),
      );
    });
  }, [clear]);

  useEffect(() => {
    setImbd({ min: 0, max: 0 });
    setName('');
    setTag([]);
    setYear({ min: 0, max: 0 });
  }, [clear]);

  const onSub = (data: any) => {
    requestInter({
      method: 'GET',
      url: API_URL.MOVIE.GET,
      params: clearParams(data),
    })
      .then(res => {
        dis(changeData(res.data));
      })
      .catch();
  };

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
                      valueField="value"
                      labelField="name"
                      options={listTag}
                      searchable={false}
                      onChange={(values: any[]) => {
                        setTag(values);
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
                    <input
                      className="input_name"
                      value={name}
                      onChange={e => {
                        setName(e?.target?.value);
                      }}
                    />
                  </div>
                </div>
                {/* end filter item */}

                {/* filter item */}
                <div className="filter__item" id="filter__rate">
                  <span className="filter__item-label">Duration:</span>
                  <InputRange
                    step={1}
                    formatLabel={undefined}
                    draggableTrack={false}
                    allowSameValues={false}
                    minValue={1}
                    maxValue={1000}
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
                    maxValue={new Date().getFullYear()}
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
              <button
                onClick={() =>
                  onSub({
                    tagId: tag?.[0]?.value,
                    originalTitle: name,
                    yearFrom: year.min !== 0 ? year.min : null,
                    yearTo: year.max !== 0 ? year.max : null,
                    durationFrom: imbd.min !== 0 ? imbd.min : null,
                    durationTo: imbd.max !== 0 ? imbd.max : null,
                  })
                }
                className="filter__btn"
                type="button"
              >
                apply filter
              </button>

              <button
                onClick={() => {
                  setClear(!clear);
                  onSub({});
                }}
                className="filter__btn"
                type="button"
              >
                Clear
              </button>
              {/* end filter btn */}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
