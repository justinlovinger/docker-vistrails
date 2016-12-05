import logging
logging.basicConfig(level=logging.ERROR)

import vistrails.core.application
from vistrails.core.console_mode import run_and_get_results
from vistrails.core.db.locator import FileLocator

def run_workflow(fname, version=None, params=''):
    app = vistrails.core.application.init()
    del vistrails.core.application.VistrailsApplicationInterface.__del__ 
    # print app.configuration
    loc = FileLocator(fname)
    run_and_get_results([(loc, version)], params)

if __name__ == '__main__':
    import sys
    if len(sys.argv) > 3:
        run_workflow(sys.argv[1], sys.argv[2], sys.argv[3])
    else:
        run_workflow(sys.argv[1], sys.argv[2])
