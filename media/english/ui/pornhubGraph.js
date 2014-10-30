$(function () {

    var gaugeOptions = {

        chart: {
            type: 'solidgauge'
        },

        title: null,

        pane: {
            center: ['50%', '85%'],
            size: '140%',
            startAngle: -90,
            endAngle: 90,
            background: {
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                innerRadius: '60%',
                outerRadius: '100%',
                shape: 'arc'
            }
        },

        tooltip: {
            enabled: false
        },

        // the value axis
        yAxis: {
            stops: [
                [0.1, '#55BF3B'], // green
                [0.5, '#DDDF0D'], // yellow
                [0.9, '#DF5353'] // red
            ],
            lineWidth: 0,
            minorTickInterval: null,
            tickPixelInterval: 400,
            tickWidth: 0,
            title: {
                y: -70
            },
            labels: {
                y: 16
            }
        },

        plotOptions: {
            solidgauge: {
                dataLabels: {
                    y: 5,
                    borderWidth: 0,
                    useHTML: true
                }
            }
        }
    };

    // $('#container-sex').highcharts(Highcharts.merge(gaugeOptions, {
    //     yAxis: {
    //         min: 0,
    //         max: 915237,
    //         title: {
    //             text: 'Speed'
    //         }
    //     },
    //
    //     credits: {
    //         enabled: false
    //     },
    //
    //     series: [{
    //         name: 'Speed',
    //         data: [80],
    //         dataLabels: {
    //             format: '<div style="text-align:center"><span style="font-size:25px;color:' +
    //                 ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
    //                    '<span style="font-size:12px;color:silver">count</span></div>'
    //         },
    //         tooltip: {
    //             valueSuffix: ' km/h'
    //         }
    //     }]
    //
    // }));

    // The RPM gauge
    $('#container-sex').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Sexual'
            }
        },

        series: [{
            name: 'Sexual',
            data: [882409],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));

    $('#container-fem').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Anti-Female'
            }
        },

        series: [{
            name: 'Anit-Female',
            data: [286107],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));

    $('#container-mal').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Anit-Male'
            }
        },

        series: [{
            name: 'Anit-Male',
            data: [165351],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));

    $('#container-rac').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Racist'
            }
        },

        series: [{
            name: 'Racist',
            data: [5007],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));

    $('#container-hom').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Homophobic'
            }
        },

        series: [{
            name: 'Homophobic',
            data: [1328],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));

    $('#container-bes').highcharts(Highcharts.merge(gaugeOptions, {
        yAxis: {
            min: 0,
            max: 915237,
            title: {
                text: 'Beastiality'
            }
        },

        series: [{
            name: 'Beastiality',
            data: [172],
            dataLabels: {
                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
                       '<span style="font-size:12px;color:silver">count</span></div>'
            }
        }]

    }));
    //
    // $('#container-oth').highcharts(Highcharts.merge(gaugeOptions, {
    //     yAxis: {
    //         min: 0,
    //         max: 915237,
    //         title: {
    //             text: 'Other'
    //         }
    //     },
    //
    //     series: [{
    //         name: 'Other',
    //         data: [15252],
    //         dataLabels: {
    //             format: '<div style="text-align:center"><span style="font-size:25px;color:' +
    //                 ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
    //                    '<span style="font-size:12px;color:silver">count</span></div>'
    //         }
    //     }]
    //
    // }));

    // // Bring life to the dials
    // setInterval(function () {
    //     // Speed
    //     var chart = $('#container-speed').highcharts(),
    //         point,
    //         newVal,
    //         inc;
    //
    //     if (chart) {
    //         point = chart.series[0].points[0];
    //         inc = Math.round((Math.random() - 0.5) * 100);
    //         newVal = point.y + inc;
    //
    //         if (newVal < 0 || newVal > 200) {
    //             newVal = point.y - inc;
    //         }
    //
    //         point.update(newVal);
    //     }
    //
    //     // RPM
    //     chart = $('#container-rpm').highcharts();
    //     if (chart) {
    //         point = chart.series[0].points[0];
    //         inc = Math.random() - 0.5;
    //         newVal = point.y + inc;
    //
    //         if (newVal < 0 || newVal > 5) {
    //             newVal = point.y - inc;
    //         }
    //
    //         point.update(newVal);
    //     }
    // }, 2000);


});
