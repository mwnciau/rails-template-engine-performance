class PartialsController < ActionController::Base
  def locals
    {
      colours:[
        { name: 'red',   current: true,  url: '#red'   },
        { name: 'green', current: false, url: '#green' },
        { name: 'blue',  current: false, url: '#blue'  },
        { name: 'yellow',  current: false, url: '#yellow'  },
        { name: 'magenta',  current: false, url: '#magenta'  },
        { name: 'cyan',  current: false, url: '#cyan'  },
        { name: 'light red',   current: false,  url: '#light-red'   },
        { name: 'light green', current: false, url: '#light-green' },
        { name: 'light blue',  current: false, url: '#light-blue'  },
        { name: 'light yellow',  current: false, url: '#light-yellow'  },
        { name: 'light magenta',  current: false, url: '#light-magenta'  },
        { name: 'light cyan',  current: false, url: '#light-cyan'  }
      ],
      header: 'Colours'
    }
  end

  def raw
    render "partials/raw", locals: locals
  end

  def erb
    render "partials/erb", locals: locals
  end

  def haml
    render "partials/haml", locals: locals
  end

  def rblade
    render "partials/rblade", locals: locals
  end

  def slim
    render "partials/slim", locals: locals
  end
end
